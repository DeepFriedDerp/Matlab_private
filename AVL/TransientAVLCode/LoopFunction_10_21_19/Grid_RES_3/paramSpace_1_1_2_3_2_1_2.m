function [aeroForces] = paramSpace_1_1_2_3_2_1_2(sailStates,airStates)

	CL = (4.172497)*sailStates.alpha + (-0.298611)*sailStates.beta + (-2.530402)*sailStates.p + (37.077320)*sailStates.q + (-1.533902)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.189590;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.501272)*sailStates.p + (0.000001)*sailStates.q + (-0.088388)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.352554)*sailStates.alpha + (0.159109)*sailStates.beta + (-1.223166)*sailStates.p + (10.899046)*sailStates.q + (-1.220502)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-12.972332)*sailStates.alpha + (1.109442)*sailStates.beta + (7.875240)*sailStates.p + (-134.612778)*sailStates.q + (5.127506)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.043336)*sailStates.alpha + (0.043829)*sailStates.beta + (0.954683)*sailStates.p + (-3.615815)*sailStates.q + (-0.008841)*sailStates.r + (-0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end