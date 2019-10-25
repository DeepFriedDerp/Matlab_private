function [aeroForces] = paramSpace_11_1_4_1_2_1_1(sailStates,airStates)

	CL = (4.836412)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.007285)*sailStates.p + (28.420841)*sailStates.q + (-1.100630)*sailStates.r + (0.010188)*sailStates.de;
	CD = -0.829110;
	CY = (0.276210)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.650669)*sailStates.p + (1.178226)*sailStates.q + (0.068513)*sailStates.r + (0.000251)*sailStates.de;

	Cl = (1.355819)*sailStates.alpha + (0.277879)*sailStates.beta + (-0.778677)*sailStates.p + (5.275278)*sailStates.q + (-1.093985)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-15.724653)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.595438)*sailStates.p + (-123.632645)*sailStates.q + (3.656277)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (-1.029271)*sailStates.alpha + (-0.029206)*sailStates.beta + (1.510591)*sailStates.p + (-8.015332)*sailStates.q + (-0.035580)*sailStates.r + (-0.000466)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end