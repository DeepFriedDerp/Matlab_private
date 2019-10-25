function [aeroForces] = paramSpace_3_1_3_1_2_3_1(sailStates,airStates)

	CL = (6.135569)*sailStates.alpha + (0.581916)*sailStates.beta + (-1.720324)*sailStates.p + (30.202362)*sailStates.q + (2.440612)*sailStates.r + (0.010993)*sailStates.de;
	CD = -2.330190;
	CY = (-0.373643)*sailStates.alpha + (-0.024526)*sailStates.beta + (1.096443)*sailStates.p + (0.221994)*sailStates.q + (-0.071857)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.332939)*sailStates.alpha + (-0.396497)*sailStates.beta + (-0.543279)*sailStates.p + (4.312458)*sailStates.q + (2.225869)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-12.285491)*sailStates.alpha + (-2.296314)*sailStates.beta + (5.241548)*sailStates.p + (-111.854546)*sailStates.q + (-8.285535)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (1.949640)*sailStates.alpha + (0.039474)*sailStates.beta + (-2.440026)*sailStates.p + (10.849272)*sailStates.q + (0.016299)*sailStates.r + (0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end