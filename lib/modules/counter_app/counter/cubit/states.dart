abstract class CounterStetes {}

class CounterInitialState extends CounterStetes {}

class CounterPlusState extends CounterStetes {
  int counter ;
  CounterPlusState(this.counter ){
   /// this.count=counter

  }
}

class CounterMinusState extends CounterStetes {
  int counter ;
  CounterMinusState(this.counter ){
    /// this.count=counter

  }
}
