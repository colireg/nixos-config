{
  javascript = {
    "Print to console" = {
      "prefix" = "cl";
      "body" = [ "console.log($0)" ];
    };
    "Create function" = {
      "prefix" = "fn";
      "body" = [
        "function \${1:name}(\${2:args}) {"
        "	$0"
        "}"
      ];
    };
    "Create async function" = {
      "prefix" = "afn";
      "body" = [
        "async function \${1:name}(\${2:args}) {"
        "	$0"
        "}"
      ];
    };
    "Create and export function" = {
      "prefix" = "efn";
      "body" = [
        "export function \${1:name}(\${2:args}) {"
        "	$0"
        "}"
      ];
    };
    "Create and export async function" = {
      "prefix" = "eafn";
      "body" = [
        "export async function \${1:name}(\${2:args}) {"
        "	$0"
        "}"
      ];
    };
    "Constructor" = {
      "prefix" = "ctor";
      "body" = [
        "constructor(\${1}) {"
        "	$0"
        "}"
      ];
    };
    "Exit the process" = {
      "prefix" = "pe";
      "body" = [ "process.exit(1)" ];
    };
  };
}
