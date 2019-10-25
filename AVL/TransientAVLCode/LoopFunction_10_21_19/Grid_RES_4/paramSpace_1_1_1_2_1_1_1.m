function [aeroForces] = paramSpace_1_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.129772)*sailStates.alpha + (-0.423957)*sailStates.beta + (-2.172434)*sailStates.p + (35.260601)*sailStates.q + (-1.664042)*sailStates.r + (0.010871)*sailStates.de;
	CD = -0.355250;
	CY = (-0.046799)*sailStates.alpha + (-0.021092)*sailStates.beta + (-0.542080)*sailStates.p + (-1.057309)*sailStates.q + (-0.107713)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.022686)*sailStates.alpha + (0.205485)*sailStates.beta + (-0.921239)*sailStates.p + (8.277584)*sailStates.q + (-1.378015)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-11.403179)*sailStates.alpha + (1.677843)*sailStates.beta + (6.434917)*sailStates.p + (-124.043571)*sailStates.q + (5.574982)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.251200)*sailStates.alpha + (0.059703)*sailStates.beta + (1.105345)*sailStates.p + (-3.556158)*sailStates.q + (-0.018268)*sailStates.r + (0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end