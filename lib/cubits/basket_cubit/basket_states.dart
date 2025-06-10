abstract class BasketStates {}

class BasketInitialStates extends BasketStates {}

class CreateBasketSuccessState extends BasketStates {}

class CreateBasketFailedState extends BasketStates {}

class CreateOrderSuccessStates extends BasketStates {}

class CreateOrderFailedStates extends BasketStates {}
