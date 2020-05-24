module namespace page = 'http://artiigo.com';

declare
  %rest:POST
  %rest:path('/team/search')
  %rest:form-param("num","{$num}","(nonum)")
  %output:method('html')
  %output:doctype-system('about:legacy-compact')
function page:searchPlayer(
 $num as xs:string
) as element(html) {
  <html>
    <head>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet"/>
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet"/>
        <link href="../static/styles.css" rel="stylesheet"/>
      <title>Team - Search</title>
    </head>
    <body>
    <!-- Jumbotron -->
    <div class="card card-image aqua-gradient">
      <div class="text-white text-center rgba-stylish-strong py-5 px-4">
        <div class="py-5">
          <!-- Content -->
          <img id="emblem" src="../static/udlaspalmas.png"/>
          <h2 class="card-title h2 my-4 py-2">UD LAS PALMAS</h2>
          <p class="mb-4 pb-2 px-md-5 mx-md-5">Little project with XQuery and data about squad from UD Las Palmas</p>
          <a class="btn blue-gradient" href="https://github.com/aaronmed/XQuerySoccerTeam"><i class="fas fa-clone left"></i> View project</a>
        </div>
      </div>
    </div>
    <!-- Jumbotron -->
    <div id ="search-container" class="container">
        <div class="row">
            <div class="col-8">
                <table id ="table-search" class="table table-bordered">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                        {
                        for $player in doc("team")/team/players/player
                        where $player/number = $num
                        return
                            <tbody>
                                <tr>
                                    <td>Name</td>
                                    <td>{$player/name/text()}</td>
                                </tr>
                                <tr>
                                    <td>Number</td>
                                    <td>{$player/number/text()}</td>
                                </tr>
                                <tr>
                                    <td>Age</td>
                                    <td>{$player/age/text()}</td>
                                </tr>
                                <tr>
                                    <td>Position</td>
                                    <td>{$player/position/text()}</td>
                                </tr>
                                <tr>
                                    <td>Country</td>
                                    <td>{$player/country/text()}</td>
                                </tr>
                                <tr>
                                    <td>Height</td>
                                    <td>{$player/height/text()}</td>
                                </tr>
                                <tr>
                                    <td>Weight</td>
                                    <td>{$player/weight/text()}</td>
                                </tr>
                                <tr>
                                    <td>Birthdate</td>
                                    <td>{$player/birthdate/text()}</td>
                                </tr>
                                <tr>
                                    <td>Foot</td>
                                    <td>{$player/foot/text()}</td>
                                </tr>
                            </tbody>
                        }
                </table>
                 {
                    for $player in doc("team")/team/players/player
                    where $player/number = $num
                    return
                 <form id="form-modify" action="/team/modify" class="border border-light p-5" method="POST">
                    <p class="h4 mb-4 text-center">Modify player</p>
                    <input type="hidden" id="id" name="id" value="{$player/id/text()}"/>
                    <input type="text" id="name" name="name" class="form-control mb-4" placeholder="Name" value="{$player/name/text()}"/>
                    <input type="number" id="number" name="num" class="form-control mb-4" placeholder="Number" value="{$player/number/text()}"/>
                    <input type="number" id="age" name="age" class="form-control mb-4" placeholder="Age" value="{$player/age/text()}"/>
                    <input type="text" id="position" name="position" class="form-control mb-4" placeholder="Position" value="{$player/position/text()}"/>
                    <input type="text" id="country" name="country" class="form-control mb-4" placeholder="Country" value="{$player/country/text()}"/>
                    <input type="text" id="height" name="height" class="form-control mb-4" placeholder="Height" value="{$player/height/text()}"/>
                    <input type="text" id="weight" name="weight" class="form-control mb-4" placeholder="Weight" value="{$player/weight/text()}"/>
                    <input type="date" id="birthdate" name="birthdate" class="form-control mb-4" placeholder="Birthdate" value="{$player/birthdate/text()}"/>
                    <input type="text" id="foot" name="foot" class="form-control mb-4" placeholder="Foot" value="{$player/foot/text()}"/>
                    <button class="btn btn-info btn-block my-4 blue-gradient" type="submit">Modify</button>
                    <button id="cancel-modify" class="btn btn-info btn-block my-4 blue-gradient" type="button">Cancel</button>
                </form>
                }
            </div>
            <div class="col-4">
                    <div class="container">
                        <div class="row">
                            <button id="modify-button" type="button" class="btn blue-gradient">Modify player</button>
                        </div>
                        <div id="delete-button" class="row">
                            <form class="form" action="/team/delete" method="POST">
                                <input type="hidden" name="num" value="{$num}"/>
                                <button type="submit" class="btn blue-gradient">Delete player</button>
                            </form>
                        </div>
                        <div id="return" class="row">
                            <a href="/team" type="submit" class="btn blue-gradient">Return</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
        <!-- JQuery -->
        <script type="text/javascript" src="../static/search.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/js/mdb.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    </body>
  </html>
};
