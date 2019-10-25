function [aeroForces] = paramSpace_1_2_2_1_1_2_2(sailStates,airStates)

	CL = (5.743665)*sailStates.alpha + (-0.864074)*sailStates.beta + (-6.189222)*sailStates.p + (56.072479)*sailStates.q + (2.649027)*sailStates.r + (0.011137)*sailStates.de;
	CD = -8.880680;
	CY = (2.990208)*sailStates.alpha + (-0.019244)*sailStates.beta + (1.507915)*sailStates.p + (4.297057)*sailStates.q + (0.199738)*sailStates.r + (0.000979)*sailStates.de;

	Cl = (-1.574518)*sailStates.alpha + (-1.081513)*sailStates.beta + (-4.274240)*sailStates.p + (36.711487)*sailStates.q + (2.881021)*sailStates.r + (0.005668)*sailStates.de;
	Cm = (8.823638)*sailStates.alpha + (3.741664)*sailStates.beta + (23.235716)*sailStates.p + (-242.890335)*sailStates.q + (-9.056225)*sailStates.r + (-0.083083)*sailStates.de;
	Cn = (-11.279537)*sailStates.alpha + (-0.106941)*sailStates.beta + (-4.037164)*sailStates.p + (17.125553)*sailStates.q + (-0.082881)*sailStates.r + (-0.000833)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end