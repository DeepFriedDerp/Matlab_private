function [aeroForces] = paramSpace_2_1_1_1_2_2_1(sailStates,airStates)

	CL = (6.114999)*sailStates.alpha + (-1.944073)*sailStates.beta + (-3.734185)*sailStates.p + (51.138111)*sailStates.q + (2.236477)*sailStates.r + (0.012929)*sailStates.de;
	CD = -6.158690;
	CY = (2.018015)*sailStates.alpha + (-0.124523)*sailStates.beta + (0.267957)*sailStates.p + (15.924462)*sailStates.q + (-0.029638)*sailStates.r + (0.003374)*sailStates.de;

	Cl = (-5.222480)*sailStates.alpha + (-1.047181)*sailStates.beta + (-1.900678)*sailStates.p + (16.461845)*sailStates.q + (2.445645)*sailStates.r + (0.001672)*sailStates.de;
	Cm = (3.330571)*sailStates.alpha + (8.555663)*sailStates.beta + (11.706930)*sailStates.p + (-165.858398)*sailStates.q + (-7.859355)*sailStates.r + (-0.068400)*sailStates.de;
	Cn = (-2.283411)*sailStates.alpha + (0.208748)*sailStates.beta + (-0.823861)*sailStates.p + (-9.363615)*sailStates.q + (-0.192925)*sailStates.r + (-0.004376)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end