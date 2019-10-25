function [aeroForces] = paramSpace_1_2_3_3_2_1_2(sailStates,airStates)

	CL = (4.257453)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.548208)*sailStates.p + (37.257633)*sailStates.q + (-1.528262)*sailStates.r + (0.011268)*sailStates.de;
	CD = -0.186910;
	CY = (-0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.483151)*sailStates.p + (-0.000001)*sailStates.q + (-0.085192)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.310085)*sailStates.alpha + (0.241575)*sailStates.beta + (-1.189218)*sailStates.p + (10.432819)*sailStates.q + (-1.185590)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-13.396097)*sailStates.alpha + (0.000000)*sailStates.beta + (7.943073)*sailStates.p + (-135.529190)*sailStates.q + (5.081775)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.001697)*sailStates.alpha + (0.042596)*sailStates.beta + (0.934836)*sailStates.p + (-3.698411)*sailStates.q + (-0.007446)*sailStates.r + (-0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end