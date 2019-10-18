function [aeroForces] = paramSpace_1_1_2_2_2_2_2(sailStates,airStates)

	CL = (7.441525)*sailStates.alpha + (0.406365)*sailStates.beta + (-2.539762)*sailStates.p + (30.031660)*sailStates.q + (-0.032836)*sailStates.r + (0.008798)*sailStates.de;
	CD = -3.964330;
	CY = (1.871705)*sailStates.alpha + (-0.054148)*sailStates.beta + (-0.415830)*sailStates.p + (15.297468)*sailStates.q + (-0.053662)*sailStates.r + (0.003255)*sailStates.de;

	Cl = (-0.834455)*sailStates.alpha + (-0.409570)*sailStates.beta + (-1.429714)*sailStates.p + (12.300567)*sailStates.q + (0.602581)*sailStates.r + (0.000531)*sailStates.de;
	Cm = (-14.456814)*sailStates.alpha + (-1.960412)*sailStates.beta + (8.953154)*sailStates.p + (-136.706177)*sailStates.q + (-0.099288)*sailStates.r + (-0.068261)*sailStates.de;
	Cn = (-1.959356)*sailStates.alpha + (-0.029954)*sailStates.beta + (0.301619)*sailStates.p + (-12.118749)*sailStates.q + (0.141948)*sailStates.r + (-0.004343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end