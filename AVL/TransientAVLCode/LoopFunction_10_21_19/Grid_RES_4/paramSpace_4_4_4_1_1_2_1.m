function [aeroForces] = paramSpace_4_4_4_1_1_2_1(sailStates,airStates)

	CL = (3.696282)*sailStates.alpha + (-0.246188)*sailStates.beta + (-1.559292)*sailStates.p + (28.094259)*sailStates.q + (1.072478)*sailStates.r + (0.009962)*sailStates.de;
	CD = -0.012550;
	CY = (-0.282395)*sailStates.alpha + (-0.021284)*sailStates.beta + (0.400406)*sailStates.p + (-1.002334)*sailStates.q + (-0.079753)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.672475)*sailStates.alpha + (-0.214891)*sailStates.beta + (-0.376552)*sailStates.p + (2.590548)*sailStates.q + (0.765513)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-12.148115)*sailStates.alpha + (0.965709)*sailStates.beta + (4.775482)*sailStates.p + (-107.565659)*sailStates.q + (-3.583768)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (0.811981)*sailStates.alpha + (0.024939)*sailStates.beta + (-0.824958)*sailStates.p + (4.424633)*sailStates.q + (0.026629)*sailStates.r + (0.000316)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end