function [aeroForces] = paramSpace_9_1_3_1_1_1_1(sailStates,airStates)

	CL = (4.432340)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.041782)*sailStates.p + (30.059345)*sailStates.q + (-0.877457)*sailStates.r + (0.010690)*sailStates.de;
	CD = -0.546800;
	CY = (-0.025354)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.411235)*sailStates.p + (-0.910010)*sailStates.q + (0.014329)*sailStates.r + (-0.000195)*sailStates.de;

	Cl = (0.917189)*sailStates.alpha + (0.242454)*sailStates.beta + (-0.786247)*sailStates.p + (5.711516)*sailStates.q + (-0.884667)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.456638)*sailStates.alpha + (0.000000)*sailStates.beta + (7.195108)*sailStates.p + (-123.255226)*sailStates.q + (2.985756)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (-0.491257)*sailStates.alpha + (-0.008467)*sailStates.beta + (0.978469)*sailStates.p + (-3.881079)*sailStates.q + (-0.002281)*sailStates.r + (0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end