function [aeroForces] = paramSpace_1_2_1_1_3_1_3(sailStates,airStates)

	CL = (7.547877)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.469203)*sailStates.p + (49.848454)*sailStates.q + (-3.874719)*sailStates.r + (0.012506)*sailStates.de;
	CD = -3.121430;
	CY = (-0.261239)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.615000)*sailStates.p + (2.260759)*sailStates.q + (-0.284983)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (3.217448)*sailStates.alpha + (0.717337)*sailStates.beta + (-1.899747)*sailStates.p + (18.562145)*sailStates.q + (-3.326001)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-12.333416)*sailStates.alpha + (0.000000)*sailStates.beta + (9.282066)*sailStates.p + (-157.393341)*sailStates.q + (12.892706)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (1.883669)*sailStates.alpha + (0.126486)*sailStates.beta + (3.283996)*sailStates.p + (-15.141438)*sailStates.q + (0.051670)*sailStates.r + (-0.000946)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end