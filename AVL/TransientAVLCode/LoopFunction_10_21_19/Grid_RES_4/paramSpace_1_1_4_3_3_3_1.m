function [aeroForces] = paramSpace_1_1_4_3_3_3_1(sailStates,airStates)

	CL = (3.911536)*sailStates.alpha + (-0.023641)*sailStates.beta + (-2.147176)*sailStates.p + (30.556065)*sailStates.q + (-0.330019)*sailStates.r + (0.010025)*sailStates.de;
	CD = -0.070050;
	CY = (0.029151)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.057620)*sailStates.p + (0.294836)*sailStates.q + (0.011493)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.114167)*sailStates.alpha + (-0.060229)*sailStates.beta + (-0.971376)*sailStates.p + (7.850860)*sailStates.q + (-0.053865)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-14.527729)*sailStates.alpha + (-0.036932)*sailStates.beta + (7.578185)*sailStates.p + (-126.097916)*sailStates.q + (1.115731)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.189787)*sailStates.alpha + (-0.011932)*sailStates.beta + (-0.284549)*sailStates.p + (1.487891)*sailStates.q + (-0.029246)*sailStates.r + (-0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end