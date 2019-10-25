function [aeroForces] = paramSpace_4_2_4_3_1_3_1(sailStates,airStates)

	CL = (4.258687)*sailStates.alpha + (0.131564)*sailStates.beta + (-2.263989)*sailStates.p + (35.627689)*sailStates.q + (1.684296)*sailStates.r + (0.010842)*sailStates.de;
	CD = -0.238850;
	CY = (-0.106140)*sailStates.alpha + (-0.025320)*sailStates.beta + (0.593167)*sailStates.p + (-0.294835)*sailStates.q + (-0.118020)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.312789)*sailStates.alpha + (-0.248954)*sailStates.beta + (-0.979399)*sailStates.p + (8.767441)*sailStates.q + (1.348945)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-12.503475)*sailStates.alpha + (-0.513377)*sailStates.beta + (6.748115)*sailStates.p + (-127.124184)*sailStates.q + (-5.626636)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.311345)*sailStates.alpha + (0.057429)*sailStates.beta + (-1.167910)*sailStates.p + (4.812953)*sailStates.q + (0.002492)*sailStates.r + (0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end