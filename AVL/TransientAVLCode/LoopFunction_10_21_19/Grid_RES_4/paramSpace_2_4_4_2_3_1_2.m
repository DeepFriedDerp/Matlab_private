function [aeroForces] = paramSpace_2_4_4_2_3_1_2(sailStates,airStates)

	CL = (4.781118)*sailStates.alpha + (0.299810)*sailStates.beta + (-2.566082)*sailStates.p + (35.928337)*sailStates.q + (-1.528015)*sailStates.r + (0.011158)*sailStates.de;
	CD = -0.589610;
	CY = (0.098813)*sailStates.alpha + (-0.024209)*sailStates.beta + (-0.654003)*sailStates.p + (0.769434)*sailStates.q + (-0.042784)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.521909)*sailStates.alpha + (0.392257)*sailStates.beta + (-1.153684)*sailStates.p + (9.438996)*sailStates.q + (-1.296495)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.444227)*sailStates.alpha + (-1.064615)*sailStates.beta + (8.382381)*sailStates.p + (-135.788696)*sailStates.q + (5.138129)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.305803)*sailStates.alpha + (0.017371)*sailStates.beta + (1.397492)*sailStates.p + (-6.845197)*sailStates.q + (0.011221)*sailStates.r + (-0.000352)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end