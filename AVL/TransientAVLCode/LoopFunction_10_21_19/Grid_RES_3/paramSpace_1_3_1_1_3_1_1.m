function [aeroForces] = paramSpace_1_3_1_1_3_1_1(sailStates,airStates)

	CL = (7.387191)*sailStates.alpha + (0.666757)*sailStates.beta + (-1.733278)*sailStates.p + (35.124065)*sailStates.q + (-3.253255)*sailStates.r + (0.011491)*sailStates.de;
	CD = -3.012560;
	CY = (0.699038)*sailStates.alpha + (-0.021837)*sailStates.beta + (-1.424839)*sailStates.p + (1.081940)*sailStates.q + (-0.251341)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (2.242512)*sailStates.alpha + (0.842454)*sailStates.beta + (-0.439793)*sailStates.p + (4.505193)*sailStates.q + (-2.811509)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-10.707629)*sailStates.alpha + (-2.575062)*sailStates.beta + (3.631420)*sailStates.p + (-108.520645)*sailStates.q + (10.811794)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-2.742348)*sailStates.alpha + (0.103632)*sailStates.beta + (3.146196)*sailStates.p + (-14.921223)*sailStates.q + (0.072552)*sailStates.r + (-0.000498)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end