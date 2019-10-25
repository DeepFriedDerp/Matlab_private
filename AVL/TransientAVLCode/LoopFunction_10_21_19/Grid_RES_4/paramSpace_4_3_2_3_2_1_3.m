function [aeroForces] = paramSpace_4_3_2_3_2_1_3(sailStates,airStates)

	CL = (3.936744)*sailStates.alpha + (-0.018665)*sailStates.beta + (-2.681300)*sailStates.p + (35.065292)*sailStates.q + (0.421527)*sailStates.r + (0.010342)*sailStates.de;
	CD = -0.066550;
	CY = (-0.030091)*sailStates.alpha + (-0.024776)*sailStates.beta + (-0.057683)*sailStates.p + (-0.194782)*sailStates.q + (0.011481)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.274538)*sailStates.alpha + (0.026833)*sailStates.beta + (-1.337482)*sailStates.p + (11.073942)*sailStates.q + (0.131629)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-14.513695)*sailStates.alpha + (0.044816)*sailStates.beta + (9.418574)*sailStates.p + (-141.871536)*sailStates.q + (-1.449811)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.193247)*sailStates.alpha + (-0.005171)*sailStates.beta + (0.365235)*sailStates.p + (-2.325885)*sailStates.q + (-0.045969)*sailStates.r + (0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end