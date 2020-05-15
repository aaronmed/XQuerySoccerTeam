module namespace page = 'http://artiigo.com';

declare
  %rest:path('/team/search')
  %rest:POST
  %rest:form-param("num","{$num}","(no num)")
  %output:method('html')
  %output:doctype-system('about:legacy-compact')
function page:start(
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
      <title>Team</title>
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
    <div id="detailed" class="container">
        <table class="table table-bordered">
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
        <button type="button" class="btn aqua-gradient" onclick="history.back()">Return to home</button>
    </div>
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/js/mdb.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script type="../text/javascript" src="static/table.js"></script>
    </body>
  </html>
};
