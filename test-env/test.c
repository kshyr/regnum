#include "regnum.h"
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <stdbool.h>

const unsigned int SCR_WIDTH = 800;
const unsigned int SCR_HEIGHT = 600;

void main_loop() {}

void input_loop() {}

int main() {
    set_window(SCR_WIDTH, SCR_HEIGHT);
    regnum_entrypoint(main_loop, input_loop);
    return 0;
}
