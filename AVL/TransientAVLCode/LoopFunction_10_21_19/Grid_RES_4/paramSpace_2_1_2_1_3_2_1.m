function [aeroForces] = paramSpace_2_1_2_1_3_2_1(sailStates,airStates)

	CL = (3.852696)*sailStates.alpha + (-0.125030)*sailStates.beta + (-1.645304)*sailStates.p + (27.636673)*sailStates.q + (-0.660842)*sailStates.r + (0.010468)*sailStates.de;
	CD = -0.037090;
	CY = (0.302858)*sailStates.alpha + (-0.026512)*sailStates.beta + (-0.320242)*sailStates.p + (1.471502)*sailStates.q + (-0.021042)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (0.824032)*sailStates.alpha + (0.059991)*sailStates.beta + (-0.514329)*sailStates.p + (3.639956)*sailStates.q + (-0.508196)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.609675)*sailStates.alpha + (0.472879)*sailStates.beta + (5.540809)*sailStates.p + (-111.058342)*sailStates.q + (2.230236)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-0.652355)*sailStates.alpha + (0.008976)*sailStates.beta + (0.644601)*sailStates.p + (-3.940144)*sailStates.q + (0.011198)*sailStates.r + (-0.000455)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end