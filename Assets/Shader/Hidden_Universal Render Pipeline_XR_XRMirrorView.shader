//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/XR/XRMirrorView" {
Properties {
}
SubShader {
 Tags { "RenderPipeline" = "UniversalPipeline" }
 Pass {
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 23609
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
uniform 	vec4 _ScaleBiasRt;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec4 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xw = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xw * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    u_xlat0.xy = u_xlat1.xy * _ScaleBiasRt.xy + _ScaleBiasRt.zw;
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(1.0);
    gl_Position = u_xlat0 * vec4(2.0, -2.0, 1.0, 1.0) + vec4(-1.0, 1.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	uint _SRGBRead;
uniform 	uint _SRGBWrite;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
bvec3 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlatb1.xy = notEqual(ivec4(uvec4(_SRGBRead, _SRGBWrite, _SRGBRead, _SRGBRead)), ivec4(0, 0, 0, 0)).xy;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    if(u_xlatb1.x){
        SV_Target0 = u_xlat10_0;
        return;
    }
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlat16_3.xyz = u_xlat10_0.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat10_0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat0.xyz = (uint(_SRGBRead) != uint(0)) ? u_xlat16_2.xyz : u_xlat10_0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    SV_Target0.xyz = (uint(_SRGBWrite) != uint(0)) ? u_xlat16_2.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
}
}
 Pass {
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 123175
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
uniform 	vec4 _ScaleBiasRt;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec4 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xw = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xw * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    u_xlat0.xy = u_xlat1.xy * _ScaleBiasRt.xy + _ScaleBiasRt.zw;
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(1.0);
    gl_Position = u_xlat0 * vec4(2.0, -2.0, 1.0, 1.0) + vec4(-1.0, 1.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	uint _SourceTexArraySlice;
uniform 	uint _SRGBRead;
uniform 	uint _SRGBWrite;
UNITY_LOCATION(0) uniform mediump sampler2DArray _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
bvec3 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.z = float(_SourceTexArraySlice);
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat10_0 = texture(_SourceTex, u_xlat0.xyz);
    u_xlatb1.xy = notEqual(ivec4(uvec4(_SRGBRead, _SRGBWrite, _SRGBRead, _SRGBRead)), ivec4(0, 0, 0, 0)).xy;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    if(u_xlatb1.x){
        SV_Target0 = u_xlat10_0;
        return;
    }
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlat16_3.xyz = u_xlat10_0.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat10_0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    u_xlat0.xyz = (uint(_SRGBRead) != uint(0)) ? u_xlat16_2.xyz : u_xlat10_0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
        u_xlat16_2 = hlslcc_movcTemp;
    }
    SV_Target0.xyz = (uint(_SRGBWrite) != uint(0)) ? u_xlat16_2.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
}
}
}
}