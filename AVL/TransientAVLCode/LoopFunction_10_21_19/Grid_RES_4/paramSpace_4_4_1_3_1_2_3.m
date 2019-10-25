function [aeroForces] = paramSpace_4_4_1_3_1_2_3(sailStates,airStates)

	CL = (3.902121)*sailStates.alpha + (-0.204196)*sailStates.beta + (-2.698690)*sailStates.p + (37.158451)*sailStates.q + (1.191788)*sailStates.r + (0.010727)*sailStates.de;
	CD = 0.043030;
	CY = (-0.053730)*sailStates.alpha + (-0.022821)*sailStates.beta + (0.307144)*sailStates.p + (-0.684400)*sailStates.q + (-0.061021)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.267072)*sailStates.alpha + (-0.203073)*sailStates.beta + (-1.304378)*sailStates.p + (11.241385)*sailStates.q + (0.812979)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-13.710649)*sailStates.alpha + (0.640859)*sailStates.beta + (8.766340)*sailStates.p + (-140.146637)*sailStates.q + (-3.952813)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.122975)*sailStates.alpha + (0.026057)*sailStates.beta + (-0.470773)*sailStates.p + (1.942302)*sailStates.q + (-0.016866)*sailStates.r + (0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end