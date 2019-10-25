function [aeroForces] = paramSpace_6_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.292278)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.364115)*sailStates.p + (33.991432)*sailStates.q + (-0.974122)*sailStates.r + (0.011074)*sailStates.de;
	CD = -0.161120;
	CY = (0.080360)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.398649)*sailStates.p + (0.351848)*sailStates.q + (-0.027889)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.263300)*sailStates.alpha + (0.185108)*sailStates.beta + (-1.035582)*sailStates.p + (8.364333)*sailStates.q + (-0.821203)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.445979)*sailStates.alpha + (0.000000)*sailStates.beta + (7.862074)*sailStates.p + (-131.203201)*sailStates.q + (3.306082)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (-0.261413)*sailStates.alpha + (0.012944)*sailStates.beta + (0.818423)*sailStates.p + (-3.744719)*sailStates.q + (0.004851)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end