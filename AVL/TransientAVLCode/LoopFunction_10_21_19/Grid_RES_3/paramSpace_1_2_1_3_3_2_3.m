function [aeroForces] = paramSpace_1_2_1_3_3_2_3(sailStates,airStates)

	CL = (3.902129)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.741740)*sailStates.p + (37.502880)*sailStates.q + (-1.108854)*sailStates.r + (0.010768)*sailStates.de;
	CD = 0.065590;
	CY = (0.049817)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.323957)*sailStates.p + (0.665000)*sailStates.q + (-0.057186)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.364146)*sailStates.alpha + (0.135457)*sailStates.beta + (-1.373527)*sailStates.p + (11.893120)*sailStates.q + (-0.813551)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-13.642555)*sailStates.alpha + (0.000000)*sailStates.beta + (8.977781)*sailStates.p + (-141.960541)*sailStates.q + (3.744960)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.150104)*sailStates.alpha + (0.023885)*sailStates.beta + (0.488515)*sailStates.p + (-1.784764)*sailStates.q + (-0.014730)*sailStates.r + (-0.000215)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end