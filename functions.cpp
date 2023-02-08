#include <Rcpp.h>
#include <unordered_map>

using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}

struct thing {
  double stuff;
  std::unordered_map<std::string, double> morestuff;
};

static thing* mything = nullptr;

// [[Rcpp::export]]
double addthing(NumericVector x){
  if(mything == nullptr){
    mything = new thing();
  }
  double n = 0.0;
  for(int i = 0; i < x.size(); i++){
    n += x[i];
  }
  mything->stuff += n;
  return mything->stuff;
}

// [[Rcpp::export]]
void deletething(NumericVector x){
  if(mything != nullptr){
    delete mything;
    mything = nullptr;
  }
}

// [[Rcpp::export]]
double mysum(NumericVector x){
  double n = 0.0;
  int = x.size();
  for(int i = 0; i < x.size(); i++){
    n += x[i];
  }
  return n;
}

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
timesTwo(42)
*/
