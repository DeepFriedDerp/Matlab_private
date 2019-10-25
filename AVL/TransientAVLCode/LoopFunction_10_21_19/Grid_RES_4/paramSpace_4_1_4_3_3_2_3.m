function [aeroForces] = paramSpace_4_1_4_3_3_2_3(sailStates,airStates)

	CL = (3.661582)*sailStates.alpha + (0.231311)*sailStates.beta + (-2.725251)*sailStates.p + (37.142529)*sailStates.q + (0.967587)*sailStates.r + (0.010471)*sailStates.de;
	CD = 0.107880;
	CY = (0.058735)*sailStates.alpha + (-0.023756)*sailStates.beta + (0.194792)*sailStates.p + (0.294837)*sailStates.q + (-0.038715)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.286837)*sailStates.alpha + (-0.040035)*sailStates.beta + (-1.415624)*sailStates.p + (12.384837)*sailStates.q + (0.696612)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-13.041919)*sailStates.alpha + (-0.922967)*sailStates.beta + (9.071232)*sailStates.p + (-141.543869)*sailStates.q + (-3.296268)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.305942)*sailStates.alpha + (0.015092)*sailStates.beta + (-0.188922)*sailStates.p + (-0.488911)*sailStates.q + (-0.045296)*sailStates.r + (-0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end