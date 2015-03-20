$(function() {

  var urlPrefix = "" // "https://ssnip.herokuapp.com"

  function getToken() {
    console.log("get token")
    return $.get("/token")
  }

  function sendRepos(repos, tokenInfo) {
    console.log("sending repos")
    var csrf_token = tokenInfo.token
    var ajaxOpts = {
      url: urlPrefix + "/actions/install",
      type: "POST",
      headers: {
        "X-CSRF-TOKEN": csrf_token,
      },
      dataType: "json",
      data: {
        repos: repos
      }
    }
    $.ajax(ajaxOpts).then(function() {
      console.log("sent repos")
    })
  }

  function submitRepos() {
    console.log("submit repos")
    var repos = $("#submit-repos").find("input").map(function(_, input) {
      return $(input).val()
    }).filter(function(_, value) {
      return value.length > 0
    }).get()

    if ( repos.length ) {
      getToken().then(sendRepos.bind(this, repos))
    } else {
      console.log("nothing to do at sendRepos()")
    }
  }

  function completeRequest(keyword, tokenInfo) {
    console.log("completing keyword")
    var csrf_token = tokenInfo.token
    var ajaxOpts = {
      url: urlPrefix + "/actions/complete",
      type: "POST",
      headers: {
        "X-CSRF-TOKEN": csrf_token,
      },
      dataType: "json",
      data: {
        q: keyword
      }
    }
    $.ajax(ajaxOpts).then(function(res) {
      $("#complete").find(".result").val(res.result.join(", "))
    })
  }

  function complete() {
    console.log("complete info")
    var keyword = $("#complete").find("input.keyword").first().val()
    if ( keyword.length ) {
      getToken().then(completeRequest.bind(this, keyword))
    } else {
      console.log("nothing to do at complete()")
    }
  }

  $(document).on("click", "#submit-repos .submit", function(e) {
    try {
      submitRepos()
    } catch(e) {
      console.log(e)
    }
    return false
  })

  $(document).on("click", "#complete .submit", function(e) {
    try {
      complete()
    } catch(e) {
      console.log(e)
    }
    return false
  })
})
