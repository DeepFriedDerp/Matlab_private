function [aeroForces] = paramSpace_3_2_4_1_2_3_3(sailStates,airStates)

	CL = (6.165760)*sailStates.alpha + (0.212870)*sailStates.beta + (-3.508841)*sailStates.p + (44.821274)*sailStates.q + (2.686981)*sailStates.r + (0.011998)*sailStates.de;
	CD = -2.387100;
	CY = (0.405594)*sailStates.alpha + (-0.025079)*sailStates.beta + (1.184302)*sailStates.p + (-0.221994)*sailStates.q + (-0.077647)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (2.059208)*sailStates.alpha + (-0.522304)*sailStates.beta + (-1.965186)*sailStates.p + (17.398153)*sailStates.q + (2.440745)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-12.543736)*sailStates.alpha + (-0.851811)*sailStates.beta + (11.210542)*sailStates.p + (-161.490479)*sailStates.q + (-9.140084)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.494809)*sailStates.alpha + (0.039215)*sailStates.beta + (-2.518341)*sailStates.p + (11.006948)*sailStates.q + (0.013180)*sailStates.r + (0.000292)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end