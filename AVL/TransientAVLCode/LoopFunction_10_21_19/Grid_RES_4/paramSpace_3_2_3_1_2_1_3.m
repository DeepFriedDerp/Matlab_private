function [aeroForces] = paramSpace_3_2_3_1_2_1_3(sailStates,airStates)

	CL = (5.854448)*sailStates.alpha + (-0.140893)*sailStates.beta + (-3.393218)*sailStates.p + (39.486038)*sailStates.q + (-1.767387)*sailStates.r + (0.010943)*sailStates.de;
	CD = -2.160720;
	CY = (-0.368163)*sailStates.alpha + (-0.025063)*sailStates.beta + (-0.930880)*sailStates.p + (-0.221995)*sailStates.q + (0.061005)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.955484)*sailStates.alpha + (0.436742)*sailStates.beta + (-1.928653)*sailStates.p + (15.993240)*sailStates.q + (-1.742044)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-14.290678)*sailStates.alpha + (0.553426)*sailStates.beta + (12.201760)*sailStates.p + (-161.490479)*sailStates.q + (5.982996)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (1.015747)*sailStates.alpha + (-0.032424)*sailStates.beta + (2.219460)*sailStates.p + (-10.427890)*sailStates.q + (-0.022993)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end