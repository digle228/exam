//: Playground - noun: a place where people can play

import Cocoa


var target = Int()

let numbers=[2, 7, 11, 15]

func twoSum(numberArray:[Int] , target:Int) ->(Int, Int){
    for var i=0; i<numberArray.count; i++ {
        for var j=1; j<numberArray.count; j++ {
            var sum = numberArray[i] + numberArray[j]
            if sum == target{
                return (i+1, j+1)
            }
        
        }
        
    }
    return (-1, -1)
}

twoSum(numbers, target: 9)


func twoSum2(numberArray:[Int], target:Int) ->  (Int, Int) {
    
    var dic = [Int:Int]()
    for (i, number) in numberArray.enumerate() {
        dic[number] = i + 1
    }
    for (i,number) in numberArray.enumerate() {
        let dif = target - number
        if dic[dif] != nil {
            return (i+1, dic[dif]!)
        }
    }
    
    return (-1, -1)
    
}