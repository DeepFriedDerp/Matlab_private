function [aeroForces] = paramSpace_7_1_3_1_1_2_1(sailStates,airStates)

	CL = (5.078075)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.052411)*sailStates.p + (29.992901)*sailStates.q + (1.397423)*sailStates.r + (0.010708)*sailStates.de;
	CD = -0.935770;
	CY = (-0.284792)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.742958)*sailStates.p + (-1.046667)*sailStates.q + (0.025908)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.435244)*sailStates.alpha + (-0.329109)*sailStates.beta + (-0.792854)*sailStates.p + (5.692866)*sailStates.q + (1.326331)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-15.462022)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.316569)*sailStates.p + (-123.745377)*sailStates.q + (-4.745595)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (1.052917)*sailStates.alpha + (-0.011493)*sailStates.beta + (-1.649477)*sailStates.p + (8.281241)*sailStates.q + (-0.010313)*sailStates.r + (0.000422)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end