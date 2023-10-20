using MioisHomework
using Test
import LinearAlgebra as LA

@testset "getdigits" begin
    @test getdigits(1234) == [1, 2, 3, 4];
    @test getdigits(0123) == [1, 2, 3];
    @test getdigits(999999999999) == [9,9,9,9,9,9,9,9,9,9,9,9];
end

@testset "touppercase" begin
    @test touppercase("julia") == "JULIA";
    @test touppercase("hello World") == "HELLO WORLD";
    @test touppercase("dsfdsf43243HH,,.sdfd&*(&(*HGJSdsghfdsjkh***))") == uppercase("dsfdsf43243HH,,.sdfd&*(&(*HGJSdsghfdsjkh***))");
end

@testset "norms" begin
    a = rand(10);
    @test firstnorm(a) == LA.norm(a,1);
    @test secondnorm(a) == LA.norm(a, 2);
    @test infnorm(a) == LA.norm(a, Inf);
    b = rand(10, 10);
    @test firstnorm(b) == LA.opnorm(b, 1);
    @test infnorm(b) == LA.opnorm(b, Inf);
end

@testset "chesscolor" begin
    @test chesscolor(['a',1], ['b',2]) == true;
    @test chesscolor(['c',3], ['c',1]) == true;
    @test chesscolor(['f',7], ['c',8]) == true;
    @test chesscolor(['b',1], ['b',2]) == false;
    @test chesscolor(['h',2], ['b',7]) == false;
    @test chesscolor(['h',5], ['c',5]) == false;    
end

@testset "isleap" begin
    @test isleap(2023) == false;
    @test isleap(1904) == true;
    @test isleap(1900) == false;
    @test isleap(1952) == true;
    @test isleap(1700) == false;
    @test isleap(1600) == true;
    @test isleap(2000) == true;
    @test isleap(2019) == false;
    @test isleap(1800) == false;

end