function [aeroForces] = paramSpace_11_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.138068)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.748928)*sailStates.p + (35.726604)*sailStates.q + (-0.071496)*sailStates.r + (0.010905)*sailStates.de;
	CD = -0.102890;
	CY = (0.022204)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.191664)*sailStates.p + (0.322048)*sailStates.q + (0.020133)*sailStates.r + (0.000070)*sailStates.de;

	Cl = (1.374291)*sailStates.alpha + (0.082858)*sailStates.beta + (-1.371150)*sailStates.p + (11.160472)*sailStates.q + (-0.199654)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-14.944947)*sailStates.alpha + (0.000000)*sailStates.beta + (9.622890)*sailStates.p + (-143.031982)*sailStates.q + (0.240034)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (-0.160779)*sailStates.alpha + (-0.008709)*sailStates.beta + (0.542424)*sailStates.p + (-3.110422)*sailStates.q + (-0.020904)*sailStates.r + (-0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end