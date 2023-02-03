//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/XR/XROcclusionMesh" {
Properties {
}
SubShader {
 Tags { "RenderPipeline" = "UniversalPipeline" }
 Pass {
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ColorMask 0 0
  ZTest Always
  Cull Off
  GpuProgramID 2651
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "XR_OCCLUSION_MESH_COMBINED" }
"#ifdef VERTEX
#version 300 es
#extension GL_AMD_vertex_shader_layer : require

in highp vec4 in_POSITION0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    gl_Layer = int(uint(in_POSITION0.z));
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
}
}
}