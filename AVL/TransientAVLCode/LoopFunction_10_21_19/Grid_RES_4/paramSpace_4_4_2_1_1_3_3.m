function [aeroForces] = paramSpace_4_4_2_1_1_3_3(sailStates,airStates)

	CL = (7.513951)*sailStates.alpha + (-0.822536)*sailStates.beta + (-3.434853)*sailStates.p + (50.460011)*sailStates.q + (3.995048)*sailStates.r + (0.012531)*sailStates.de;
	CD = -3.104030;
	CY = (0.248731)*sailStates.alpha + (-0.017623)*sailStates.beta + (1.614483)*sailStates.p + (-2.326705)*sailStates.q + (-0.321057)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (3.164292)*sailStates.alpha + (-0.976157)*sailStates.beta + (-1.830002)*sailStates.p + (18.154385)*sailStates.q + (3.369813)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-11.988358)*sailStates.alpha + (3.019866)*sailStates.beta + (8.824507)*sailStates.p + (-155.326050)*sailStates.q + (-13.179823)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (-1.818309)*sailStates.alpha + (0.127845)*sailStates.beta + (-3.291142)*sailStates.p + (15.277561)*sailStates.q + (0.056629)*sailStates.r + (0.000984)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end