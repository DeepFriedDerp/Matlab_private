function [aeroForces] = paramSpace_4_4_4_2_3_3_1(sailStates,airStates)

	CL = (4.129772)*sailStates.alpha + (-0.423957)*sailStates.beta + (-2.172434)*sailStates.p + (35.260601)*sailStates.q + (1.664041)*sailStates.r + (0.010871)*sailStates.de;
	CD = -0.355250;
	CY = (0.046799)*sailStates.alpha + (-0.028480)*sailStates.beta + (0.542080)*sailStates.p + (1.057309)*sailStates.q + (-0.107713)*sailStates.r + (0.000221)*sailStates.de;

	Cl = (0.881017)*sailStates.alpha + (-0.411074)*sailStates.beta + (-0.826882)*sailStates.p + (7.089703)*sailStates.q + (1.359119)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-11.403179)*sailStates.alpha + (1.677843)*sailStates.beta + (6.434917)*sailStates.p + (-124.043571)*sailStates.q + (-5.574982)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.364331)*sailStates.alpha + (0.062938)*sailStates.beta + (-1.124114)*sailStates.p + (3.792442)*sailStates.q + (-0.014509)*sailStates.r + (-0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end