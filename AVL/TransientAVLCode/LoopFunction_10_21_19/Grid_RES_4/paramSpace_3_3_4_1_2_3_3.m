function [aeroForces] = paramSpace_3_3_4_1_2_3_3(sailStates,airStates)

	CL = (6.165759)*sailStates.alpha + (-0.212870)*sailStates.beta + (-3.508841)*sailStates.p + (44.821266)*sailStates.q + (2.686981)*sailStates.r + (0.011998)*sailStates.de;
	CD = -2.387100;
	CY = (0.405594)*sailStates.alpha + (-0.024874)*sailStates.beta + (1.184302)*sailStates.p + (-0.221994)*sailStates.q + (-0.077647)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (2.024227)*sailStates.alpha + (-0.642757)*sailStates.beta + (-1.932541)*sailStates.p + (16.994268)*sailStates.q + (2.438563)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-12.543736)*sailStates.alpha + (0.851811)*sailStates.beta + (11.210544)*sailStates.p + (-161.490479)*sailStates.q + (-9.140083)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.441422)*sailStates.alpha + (0.037147)*sailStates.beta + (-2.520480)*sailStates.p + (11.033421)*sailStates.q + (0.013323)*sailStates.r + (0.000292)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end