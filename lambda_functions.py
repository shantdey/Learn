lambda num: num**3
def square(num):
    return num**2
def cube(num):
    return num**3
def higher_order(num_list, transform_list):
    first_item = transform_list(num_list[0])
    second_item = transform_list(num_list[1])
    return [first_item, second_item]
list_new = [55,66]
transformed_list = higher_order(list_new, square)
transformed_list1 = higher_order(list_new, cube)
#using regular function
print(f"Square:{transformed_list},cube:{transformed_list1}")
list_new = [55,66]
#using lambda function
transformed_list2 = higher_order(list_new, lambda num:num**2)
transformed_list3 = higher_order(list_new, lambda num:num**3)
print(f"Lambda Square:{transformed_list2},Lambda cube:{transformed_list3}")


#Higher Order Functions Map and Filter functions
nums_list = [2,3,4,5,6]
list_of_num = list(map(lambda num:num**3, nums_list))
print(list_of_num)
#Filter Function only keeps items if they meet a given condition
#e.g keep only odd numbers
nums_list1 = [2,3,4,5,6,7,8,9,10, 11, 12,13]
list_of_odd = list(filter(lambda num: num % 2 !=0, nums_list1))
print(list_of_odd)

