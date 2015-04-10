#version 430 core
uniform sampler1D cel_sampler;

in Vertex
{
  vec3 normal;
  vec3 color;
} vertex;

in vec3 L;
in vec3 V;

uniform float inner_line_width = 0.15;

out vec4 color;

void main(void) 
{
  vec3 N_fs = normalize(vertex.normal);
  vec3 L_fs = normalize(L);
  vec3 V_fs = normalize(V);

  float tc = pow(max(0.0, dot(N_fs, L_fs)), 2.0);

  color = texture(cel_sampler, tc);
  //float dot_product = dot(V_fs, N_fs);
  //if(dot_product < inner_line_width && dot_product > -inner_line_width) {
  //  color = vec4(0,0,0, 1);
  //}
}