function [aeroForces] = paramSpace_4_3_4_3_1_3_3(sailStates,airStates)

	CL = (4.253695)*sailStates.alpha + (-0.140951)*sailStates.beta + (-2.765140)*sailStates.p + (39.902107)*sailStates.q + (1.887190)*sailStates.r + (0.011088)*sailStates.de;
	CD = -0.241440;
	CY = (-0.019997)*sailStates.alpha + (-0.024177)*sailStates.beta + (0.655266)*sailStates.p + (-0.684400)*sailStates.q + (-0.130414)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.501404)*sailStates.alpha + (-0.342045)*sailStates.beta + (-1.359335)*sailStates.p + (12.333834)*sailStates.q + (1.508452)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-12.595639)*sailStates.alpha + (0.545204)*sailStates.beta + (8.365721)*sailStates.p + (-141.172913)*sailStates.q + (-6.304744)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.196996)*sailStates.alpha + (0.059061)*sailStates.beta + (-1.221806)*sailStates.p + (4.993789)*sailStates.q + (-0.003427)*sailStates.r + (0.000282)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end