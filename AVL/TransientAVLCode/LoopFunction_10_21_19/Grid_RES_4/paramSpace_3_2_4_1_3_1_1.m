function [aeroForces] = paramSpace_3_2_4_1_3_1_1(sailStates,airStates)

	CL = (6.927455)*sailStates.alpha + (-0.165215)*sailStates.beta + (-1.640789)*sailStates.p + (25.072983)*sailStates.q + (-2.436053)*sailStates.r + (0.010076)*sailStates.de;
	CD = -2.781520;
	CY = (0.684800)*sailStates.alpha + (-0.024090)*sailStates.beta + (-1.261932)*sailStates.p + (1.915490)*sailStates.q + (0.082914)*sailStates.r + (0.000407)*sailStates.de;

	Cl = (2.077241)*sailStates.alpha + (0.498325)*sailStates.beta + (-0.493781)*sailStates.p + (2.551623)*sailStates.q + (-2.270636)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-16.611115)*sailStates.alpha + (0.615150)*sailStates.beta + (6.487148)*sailStates.p + (-113.694908)*sailStates.q + (8.203823)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (-2.594758)*sailStates.alpha + (-0.038654)*sailStates.beta + (2.812728)*sailStates.p + (-14.336830)*sailStates.q + (-0.033874)*sailStates.r + (-0.000755)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end