class TodoFetch {
  static String fetchAll = r"""
    query getInag($inag001:String){
 
  getInag(inag001:$inag001) {
    inagent
    inagsite
    inag001
    inag004
    getInagDataLoader(inag001:"3130152200") {
      inagent
      inagsite
      inag001
      inag004
    }
    
    
    
  }
  
}
  """;

  static String fetchActive = """query getActiveTodos{
  todos(where: {is_public: {_eq: false}, is_completed: {_eq: false}}, order_by: {created_at: desc}) {
    __typename
    is_completed
    id
    title
  }
  }""";
  static String fetchCompleted = """query getCompletedTodos{
  todos(where: {is_public: {_eq: false}, is_completed: {_eq: true}}, order_by: {created_at: desc}) {
    __typename
    is_completed
    id
    title
  }
  }""";

  static String fetchBackend = """query getCompletedTodos{
  todos(where: {is_public: {_eq: false}, is_completed: {_eq: true}}, order_by: {created_at: desc}) {
    __typename
    is_completed
    id
    title
  }
  }""";
}
