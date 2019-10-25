function [aeroForces] = paramSpace_1_2_1_2_1_2_3(sailStates,airStates)

	CL = (3.726371)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.912640)*sailStates.p + (38.481792)*sailStates.q + (-0.836566)*sailStates.r + (0.010846)*sailStates.de;
	CD = 0.096360;
	CY = (-0.085543)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.139529)*sailStates.p + (-0.491415)*sailStates.q + (-0.024556)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.275349)*sailStates.alpha + (0.089363)*sailStates.beta + (-1.507168)*sailStates.p + (12.915030)*sailStates.q + (-0.590094)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-13.411128)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.807824)*sailStates.p + (-147.390610)*sailStates.q + (2.863414)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.321285)*sailStates.alpha + (0.015757)*sailStates.beta + (0.081627)*sailStates.p + (1.027873)*sailStates.q + (-0.043085)*sailStates.r + (0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end