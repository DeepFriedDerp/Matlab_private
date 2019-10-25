function [aeroForces] = paramSpace_1_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.163727)*sailStates.alpha + (-0.403606)*sailStates.beta + (-2.173041)*sailStates.p + (35.212654)*sailStates.q + (-1.656150)*sailStates.r + (0.010956)*sailStates.de;
	CD = -0.361400;
	CY = (-0.049275)*sailStates.alpha + (-0.021311)*sailStates.beta + (-0.527806)*sailStates.p + (-1.057312)*sailStates.q + (-0.104949)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.026489)*sailStates.alpha + (0.198688)*sailStates.beta + (-0.921547)*sailStates.p + (8.275359)*sailStates.q + (-1.355039)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-11.605862)*sailStates.alpha + (1.547159)*sailStates.beta + (6.443878)*sailStates.p + (-124.043571)*sailStates.q + (5.529930)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.245546)*sailStates.alpha + (0.058570)*sailStates.beta + (1.083787)*sailStates.p + (-3.544971)*sailStates.q + (-0.017592)*sailStates.r + (0.000219)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end