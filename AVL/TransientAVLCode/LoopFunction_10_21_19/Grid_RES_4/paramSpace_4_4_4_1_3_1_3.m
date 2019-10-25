function [aeroForces] = paramSpace_4_4_4_1_3_1_3(sailStates,airStates)

	CL = (6.049912)*sailStates.alpha + (0.300614)*sailStates.beta + (-3.191265)*sailStates.p + (34.145508)*sailStates.q + (-1.342039)*sailStates.r + (0.009219)*sailStates.de;
	CD = -2.401810;
	CY = (-0.260500)*sailStates.alpha + (-0.028288)*sailStates.beta + (-0.949373)*sailStates.p + (1.002334)*sailStates.q + (0.188950)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (2.354240)*sailStates.alpha + (0.509568)*sailStates.beta + (-1.782752)*sailStates.p + (13.796790)*sailStates.q + (-1.458669)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-15.706566)*sailStates.alpha + (-1.098210)*sailStates.beta + (12.886749)*sailStates.p + (-160.076111)*sailStates.q + (4.263530)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (0.608385)*sailStates.alpha + (-0.063123)*sailStates.beta + (2.477154)*sailStates.p + (-13.332130)*sailStates.q + (-0.132397)*sailStates.r + (-0.000540)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end