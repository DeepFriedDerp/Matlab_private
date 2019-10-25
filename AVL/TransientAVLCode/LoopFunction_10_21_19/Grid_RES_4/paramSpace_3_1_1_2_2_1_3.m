function [aeroForces] = paramSpace_3_1_1_2_2_1_3(sailStates,airStates)

	CL = (4.364946)*sailStates.alpha + (-0.191343)*sailStates.beta + (-2.923418)*sailStates.p + (36.728973)*sailStates.q + (-0.639324)*sailStates.r + (0.010876)*sailStates.de;
	CD = -0.426220;
	CY = (-0.080335)*sailStates.alpha + (-0.024862)*sailStates.beta + (-0.407941)*sailStates.p + (-0.100924)*sailStates.q + (0.026749)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.529614)*sailStates.alpha + (0.165452)*sailStates.beta + (-1.568127)*sailStates.p + (13.045300)*sailStates.q + (-0.707204)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.712685)*sailStates.alpha + (0.853829)*sailStates.beta + (10.262191)*sailStates.p + (-147.195892)*sailStates.q + (2.203316)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.086959)*sailStates.alpha + (-0.015429)*sailStates.beta + (0.994115)*sailStates.p + (-4.664021)*sailStates.q + (-0.012413)*sailStates.r + (-0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end