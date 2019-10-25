function [aeroForces] = paramSpace_1_2_3_2_1_2_3(sailStates,airStates)

	CL = (3.825204)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.914627)*sailStates.p + (38.364956)*sailStates.q + (-0.811960)*sailStates.r + (0.011060)*sailStates.de;
	CD = 0.066280;
	CY = (-0.078818)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.100284)*sailStates.p + (-0.491415)*sailStates.q + (-0.017729)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.289736)*sailStates.alpha + (0.069748)*sailStates.beta + (-1.508102)*sailStates.p + (12.909768)*sailStates.q + (-0.526100)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-13.905247)*sailStates.alpha + (0.000000)*sailStates.beta + (9.833004)*sailStates.p + (-147.390610)*sailStates.q + (2.720614)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.298772)*sailStates.alpha + (0.012298)*sailStates.beta + (0.022745)*sailStates.p + (1.057716)*sailStates.q + (-0.042033)*sailStates.r + (0.000112)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end