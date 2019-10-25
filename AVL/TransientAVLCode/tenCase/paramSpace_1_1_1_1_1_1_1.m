function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (3.924681)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.502711)*sailStates.p + (35.242359)*sailStates.q + (0.880595)*sailStates.r + (0.010750)*sailStates.de;
	CD = 0.059110;
	CY = (-0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.198316)*sailStates.p + (0.000000)*sailStates.q + (-0.034968)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.217267)*sailStates.alpha + (-0.099158)*sailStates.beta + (-1.174679)*sailStates.p + (9.888089)*sailStates.q + (0.604485)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-13.950761)*sailStates.alpha + (0.000000)*sailStates.beta + (8.316363)*sailStates.p + (-135.529175)*sailStates.q + (-2.964743)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (-0.105817)*sailStates.alpha + (0.017484)*sailStates.beta + (-0.273805)*sailStates.p + (0.609095)*sailStates.q + (-0.021786)*sailStates.r + (0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end