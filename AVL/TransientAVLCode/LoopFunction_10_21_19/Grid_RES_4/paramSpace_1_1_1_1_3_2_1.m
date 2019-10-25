function [aeroForces] = paramSpace_1_1_1_1_3_2_1(sailStates,airStates)

	CL = (3.696281)*sailStates.alpha + (-0.246188)*sailStates.beta + (-1.559292)*sailStates.p + (28.094259)*sailStates.q + (-1.072477)*sailStates.r + (0.009962)*sailStates.de;
	CD = -0.012550;
	CY = (0.282395)*sailStates.alpha + (-0.028288)*sailStates.beta + (-0.400406)*sailStates.p + (1.002334)*sailStates.q + (-0.079753)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (0.845921)*sailStates.alpha + (0.099002)*sailStates.beta + (-0.470909)*sailStates.p + (3.778430)*sailStates.q + (-0.784409)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-12.148114)*sailStates.alpha + (0.965709)*sailStates.beta + (4.775482)*sailStates.p + (-107.565659)*sailStates.q + (3.583768)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-0.733953)*sailStates.alpha + (0.037498)*sailStates.beta + (0.806189)*sailStates.p + (-4.188348)*sailStates.q + (0.022870)*sailStates.r + (-0.000316)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end