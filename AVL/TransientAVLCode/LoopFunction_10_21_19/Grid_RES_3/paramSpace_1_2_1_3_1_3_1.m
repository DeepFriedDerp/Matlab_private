function [aeroForces] = paramSpace_1_2_1_3_1_3_1(sailStates,airStates)

	CL = (3.987811)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.217414)*sailStates.p + (31.024540)*sailStates.q + (-0.015661)*sailStates.r + (0.010116)*sailStates.de;
	CD = -0.103700;
	CY = (-0.100501)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.192697)*sailStates.p + (-0.665000)*sailStates.q + (0.034041)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.135569)*sailStates.alpha + (-0.069827)*sailStates.beta + (-0.960888)*sailStates.p + (7.340981)*sailStates.q + (0.154282)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-14.663409)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.016638)*sailStates.p + (-129.097870)*sailStates.q + (0.133269)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.393963)*sailStates.alpha + (-0.012312)*sailStates.beta + (-0.572641)*sailStates.p + (3.640833)*sailStates.q + (-0.044173)*sailStates.r + (0.000249)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end