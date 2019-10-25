function [aeroForces] = paramSpace_2_1_1_1_2_3_2(sailStates,airStates)

	CL = (6.090209)*sailStates.alpha + (0.417274)*sailStates.beta + (-2.488792)*sailStates.p + (32.068348)*sailStates.q + (1.878209)*sailStates.r + (0.010297)*sailStates.de;
	CD = -2.145950;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.952663)*sailStates.p + (-0.000000)*sailStates.q + (0.062441)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.867858)*sailStates.alpha + (-0.350469)*sailStates.beta + (-1.229166)*sailStates.p + (9.615443)*sailStates.q + (1.813136)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-15.378508)*sailStates.alpha + (-1.577478)*sailStates.beta + (9.178714)*sailStates.p + (-136.150452)*sailStates.q + (-6.334773)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.421895)*sailStates.alpha + (-0.035135)*sailStates.beta + (-2.226907)*sailStates.p + (10.503640)*sailStates.q + (-0.022015)*sailStates.r + (0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end