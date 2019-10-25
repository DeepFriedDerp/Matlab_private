function [aeroForces] = paramSpace_4_2_1_1_1_1_2(sailStates,airStates)

	CL = (5.165812)*sailStates.alpha + (-0.096232)*sailStates.beta + (-2.262038)*sailStates.p + (27.551342)*sailStates.q + (-0.851904)*sailStates.r + (0.009189)*sailStates.de;
	CD = -1.583990;
	CY = (-0.183949)*sailStates.alpha + (-0.026573)*sailStates.beta + (-0.567462)*sailStates.p + (-1.664519)*sailStates.q + (0.113054)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (1.122533)*sailStates.alpha + (0.330962)*sailStates.beta + (-1.095052)*sailStates.p + (8.094442)*sailStates.q + (-1.093528)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-15.918507)*sailStates.alpha + (0.421190)*sailStates.beta + (9.088402)*sailStates.p + (-132.472137)*sailStates.q + (2.784918)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.302578)*sailStates.alpha + (-0.071672)*sailStates.beta + (1.517350)*sailStates.p + (-6.116593)*sailStates.q + (-0.041638)*sailStates.r + (0.000357)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end