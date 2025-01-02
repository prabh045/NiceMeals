//
//  NiceMealsTests.swift
//  NiceMealsTests
//
//  Created by Prabhdeep Singh on 21/12/24.
//

@testable import NiceMeals
import XCTest

final class MealCategoryViewModelTests: XCTestCase {
    var sut: MealCategoryListViewModel!
    var fetchMealsUseCase: MockFetchMealsUseCaseImp!
    var mealsCategoryRepo: MealCategoryRepo!
    var networkServiceRepo: NetworkServiceRepo!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkServiceRepo = NetworkServiceImpl()
        mealsCategoryRepo = MealCategoryRepoImpl(networkService: networkServiceRepo)
        fetchMealsUseCase = MockFetchMealsUseCaseImp()
        sut = MealCategoryListViewModel(fetchMealsCategoryUseCase: fetchMealsUseCase)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        fetchMealsUseCase = nil
        mealsCategoryRepo = nil
        networkServiceRepo = nil
        sut = nil
    }
    
    func testFetchMeals() async {
        await sut.fetchMeals()
        XCTAssert(fetchMealsUseCase.didCallExecute, "Fetch meals execute must be called")
    }
    
    func testMealCategoriesSuccess() async {
        fetchMealsUseCase.isSuccess = true
        await sut.fetchMeals()
        XCTAssert(sut.mealViewModel?.mealCategories.isEmpty == false, "Meal Categories should not be empty")
    }
    
    func testMealCategoriesFailure() async {
        fetchMealsUseCase.isSuccess = false
        await sut.fetchMeals()
        XCTAssertNil(sut.mealViewModel?.mealCategories, "Meal Categories should evaluate to nil on invalid response")
    }

}
